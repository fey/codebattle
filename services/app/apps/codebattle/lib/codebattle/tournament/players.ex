defmodule Codebattle.Tournament.Players do
  def create_table do
    :ets.new(:t_players, [:set, :public, {:write_concurrency, true}, {:read_concurrency, true}])
  end

  def count(tournament) do
    :ets.select_count(tournament.players_table, [{:_, [], [true]}])
  end

  def put_player(tournament, player) do
    :ets.insert(tournament.players_table, {player.id, player})
  end

  def get_player(tournament, player_id) do
    :ets.lookup_element(tournament.players_table, player_id, 2)
  rescue
    _e ->
      nil
  end

  def get_players(tournament) do
    :ets.select(tournament.players_table, [{{:"$1", :"$2"}, [], [:"$2"]}])
  end

  def get_players(tournament, player_ids) do
    Enum.map(player_ids, fn player_id ->
      get_player(tournament, player_id)
    end)
  end
end

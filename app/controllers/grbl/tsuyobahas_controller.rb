class Grbl::TsuyobahasController < BaseController
  def show
    @gold_bar_tsuyobaha = GoldBar.find_by(enemy_id: 1)
    @gold_bar_historys = GoldBarHistory.all.order(:drop_date)
  end
  def update
    counter = params[:counter].to_i

    gold_bar =
        case counter
        when 1..6
          gold_bar = GoldBar.find_by(enemy_id: 1)
          gold_bar.total_count += 1
          gold_bar.red_box += 1 if counter == 2
          gold_bar.blue_box += 1 if [3, 4, 5, 6].include?(counter)
          gold_bar.gold_bar += 1 if counter == 3
          gold_bar.eikan += 1 if counter == 4
          gold_bar.hagyo += 1 if counter == 5
          gold_bar.shigoku += 1 if counter == 6

          if counter == 2
            GoldBarHistory.new(name: "つよばは", box: "赤箱", drop_date: Date.today).save
          end
          if counter == 3
            GoldBarHistory.new(name: "つよばは", box: "青箱", drop_date: Date.today).save
          end

          gold_bar

        when 7..8
          gold_bar = GoldBar.find_by(enemy_id: 2)
          gold_bar.red_box += 1 if counter == 7
          gold_bar.gold_box += 1 if counter == 8

          if counter == 7
            GoldBarHistory.new(name: "あるばは", box: "赤箱", drop_date: Date.today).save
          end
          if counter == 8
            GoldBarHistory.new(name: "あるばは", box: "金箱", drop_date: Date.today).save
          end


          gold_bar
        when 9
          gold_bar = GoldBar.find_by(enemy_id: 3)
          gold_bar.gold_bar += 1

          GoldBarHistory.new(name: "黒黄", box: "赤箱", drop_date: Date.today).save

          gold_bar
        when 10
          gold_bar = GoldBar.find_by(enemy_id: 4)
          gold_bar.gold_bar += 1

          GoldBarHistory.new(name: "アーカーシャ", box: "青箱", drop_date: Date.today).save

          gold_bar
        when 11
          gold_bar = GoldBar.find_by(enemy_id: 4)
          gold_bar.gold_bar += 1

          GoldBarHistory.new(name: "グランデ", box: "青箱", drop_date: Date.today).save

          gold_bar
        end

    gold_bar.save!


    redirect_to action: :show
  end
end

require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  fixtures :all

  test 'feed is rendered successfully' do
    get :show, format: :tile
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'tile square text is rendered successfully' do
    get :show, format: :tile
    assert_select 'tile' do
      assert_select 'visual' do
        assert_select 'binding[template="TileSquare150x150Text04"]' do
          assert_select 'text[id="1"]', 'Post 1'
        end
      end
    end
  end

  test 'tile wide text is rendered successfully' do
    get :show, format: :tile
    assert_select 'tile' do
      assert_select 'visual' do
        assert_select 'binding[template="TileWide310x150Text03"]' do
          assert_select 'text[id="1"]', 'Post 1'
        end
      end
    end
  end

  test 'tile square text list is rendered successfully' do
    get :show, format: :tile
    assert_select 'tile' do
      assert_select 'visual' do
        assert_select 'binding[template="TileSquare310x310TextList02"]' do
          assert_select 'text[id="1"]', 'Post 1'
          assert_select 'text[id="2"]', 'Post 2'
          assert_select 'text[id="3"]', 'Post 3'
        end
      end
    end
  end

end

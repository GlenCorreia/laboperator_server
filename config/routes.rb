Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace 'api' do 
    namespace 'v1' do
      post 'laboperator/sanitize_signal', to: 'operator#clean_signal'
      get  'laboperator/sanitize_file',   to: 'operator#clean_file'
    end
  end
end

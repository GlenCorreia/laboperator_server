Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do 
    namespace 'v1' do
      post 'laboperator/sanitize_signal', to: 'operator#clean_signal'
      get  'laboperator/sanitize_file',   to: 'operator#clean_file'
    end
  end
end

Gearlocker::Application.routes.draw do
  devise_for :groups

  authenticated :group do
    root to: 'home#index', as: "authenticated_root"
  end

  unauthenticated do
    root to: 'home#home', as: "unauthenticated_root"
  end

end

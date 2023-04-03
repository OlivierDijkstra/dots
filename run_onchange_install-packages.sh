#!/bin/sh

echo "🚀 Starting vim-plug installation..."

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "🔎 vim-plug not found, installing..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    if [ $? -eq 0 ]; theuin
        echo "✅ vim-plug installed successfully!"
    else
        echo "❌ vim-plug installation failed. Please try again."
    fi
else
    echo "✨ vim-plug is already installed!"
fi

echo "🎉 vim-plug installation process complete!"

echo "📦 Installing plugins with vim-plug..."

nvim --headless +PlugInstall +qall

if [ $? -eq 0 ]; then
    echo "✅ Plugins installed successfully!"
else
    echo "❌ Plugin installation failed. Please try again."
fi

echo "🎉 Plugin installation process complete!"



# Welcome to My Personal Neovim Configuration Repository

This setup leverages Lua for enhanced performance and customization, aiming to provide a modern and efficient editing experience.

## Features

- **Lazy Plugin Management**: Utilizes `lazy.nvim` for optimized plugin loading, ensuring faster startup times.
- **Modular Configuration**: Settings are organized within the `lua/` directory, promoting clarity and ease of maintenance.
- **Custom Plugins Setup**: The `plugins` module specifies and configures all plugins, allowing for tailored functionality.

## Installation

To replicate this configuration:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/nathanielketema/nvim.git ~/.config/nvim
   ```

2. **Launch Neovim**:

   ```bash
   nvim
   ```

   On the first run, `lazy.nvim` will automatically install and set up the specified plugins.

## Structure

- `init.lua`: The main entry point that initializes the configuration and sets up plugins using `lazy.nvim`.
- `lua/nathaniel/`: Contains modular Lua scripts for various configurations and settings.
- `lua/plugins/`: Defines and configures plugins to extend Neovim's functionality.

Feel free to explore, fork, and suggest improvements. Contributions that enhance functionality, performance, or usability are always welcome.

*Note: This configuration is tailored to my personal workflow and preferences. It's recommended to review and adjust settings to align with your own requirements.* 

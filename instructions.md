# CodeCompanion Filesystem Function Usage Instructions

This document describes how to use each filesystem function in my workspace with CodeCompanion. Follow these guidelines for all file and directory operations.

---

## filesystem\_\_read_file

- Use to read the entire contents of a file as text.
- Optionally, use `head` or `tail` to read only the first or last N lines.
- Deprecated: Prefer `filesystem__read_text_file` for new code.

## filesystem\_\_read_text_file

- Use to read the complete contents of a file as text, with proper encoding.
- Supports reading only the first or last N lines using `head` or `tail`.
- Use for all text file reading operations.

## filesystem\_\_read_media_file

- Use to read image or audio files.
- Returns base64 encoded data and MIME type.
- Use when working with media files.

## filesystem\_\_read_multiple_files

- Use to read the contents of multiple files at once.
- Returns each file’s content with its path.
- Use for batch file reading tasks.

## filesystem\_\_write_file

- Use to create a new file or overwrite an existing file with new content.
- Overwrites existing files without warning.
- Use with caution and confirm before overwriting important files.

## filesystem\_\_edit_file

- Use to make line-based edits to a text file.
- Each edit replaces exact line sequences with new content.
- Returns a git-style diff showing the changes made.
- Use for precise, line-level file modifications.

## filesystem\_\_create_directory

- Use to create a new directory or ensure a directory exists.
- Can create nested directories in one operation.
- Use for setting up or organizing project folders.

## filesystem\_\_list_directory

- Use to get a detailed listing of all files and directories in a specified path.
- Clearly distinguishes between files and directories.
- Use for exploring directory contents.

## filesystem\_\_list_directory_with_sizes

- Use to list all files and directories in a path, including their sizes.
- Can sort entries by name or size.
- Use for storage analysis and management.

## filesystem\_\_directory_tree

- Use to get a recursive tree view of files and directories as a JSON structure.
- Each entry includes name, type, and children (for directories).
- Use for visualizing or analyzing directory structures.

## filesystem\_\_move_file

- Use to move or rename files and directories.
- Can move files between directories or rename them.
- Fails if the destination exists.
- Use for organizing or refactoring files.

## filesystem\_\_search_files

- Use to recursively search for files and directories matching a pattern.
- Case-insensitive and matches partial names.
- Use for locating files when the exact location is unknown.

## filesystem\_\_get_file_info

- Use to retrieve detailed metadata about a file or directory.
- Includes size, creation time, last modified time, permissions, and type.
- Use for auditing or inspecting files.

## filesystem\_\_list_allowed_directories

- Use to get the list of directories accessible to CodeCompanion.
- Use before performing file operations to ensure paths are permitted.

---

## General Best Practices

- Always validate file and directory paths before performing operations.
- Handle errors and exceptions gracefully.
- Avoid hardcoding paths; use configuration or environment variables.
- Clean up temporary files and directories after use.
- Log all file operations for traceability.

---

## Review Checklist

- Are the correct filesystem functions used for each operation?
- Are file paths validated and within allowed directories?
- Is error handling implemented for all file operations?
- Is sensitive data protected during file operations?

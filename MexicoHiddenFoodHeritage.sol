// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Mexico Hidden Food Heritage Registry
/// @notice On-chain registry of real, lesser-known regional dishes and culinary traditions from Mexico, with community voting.
/// @dev Country-specific: focused on Mexico's hyper-regional food culture and local culinary identity.

contract MexicoHiddenFoodHeritage {

    struct Dish {
        string state;           // e.g., Oaxaca, Puebla, Yucatán
        string town;            // specific town or locality
        string dishName;        // name of the regional dish
        string keyIngredient;   // unique or defining ingredient
        string culturalNote;    // brief factual context or tradition
        string whyItMatters;    // cultural significance
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    Dish[] public dishes;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event DishRecorded(uint256 indexed id, string dishName, string town, address indexed creator);
    event DishVoted(uint256 indexed id, bool like, uint256 likes, uint256 dislikes);

    constructor() {
        dishes.push(
            Dish({
                state: "Oaxaca",
                town: "Example Town",
                dishName: "Example Dish (replace with real entries)",
                keyIngredient: "example ingredient",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe culinary and cultural relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    /// @notice Record a new hidden regional dish from Mexico.
    function recordDish(
        string calldata state,
        string calldata town,
        string calldata dishName,
        string calldata keyIngredient,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(state).length > 0, "State required");
        require(bytes(town).length > 0, "Town required");
        require(bytes(dishName).length > 0, "Dish name required");

        dishes.push(
            Dish({
                state: state,
                town: town,
                dishName: dishName,
                keyIngredient: keyIngredient,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit DishRecorded(dishes.length - 1, dishName, town, msg.sender);
    }

    /// @notice Vote on whether a recorded dish is culturally relevant or useful.
    function voteDish(uint256 id, bool like) external {
        require(id < dishes.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Dish storage d = dishes[id];

        if (like) {
            d.likes += 1;
        } else {
            d.dislikes += 1;
        }

        emit DishVoted(id, like, d.likes, d.dislikes);
    }

    /// @notice Returns the total number of recorded dishes.
    function totalDishes() external view returns (uint256) {
        return dishes.length;
    }
}

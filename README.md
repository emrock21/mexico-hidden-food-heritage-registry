# Mexico Hidden Food Heritage Registry

On-chain registry of real, lesser-known regional dishes and culinary traditions from Mexico.

This contract focuses on foods that are culturally significant but not mainstream or globally commercialized, such as:

- Hyper-regional traditional dishes
- Indigenous preparations
- Ceremonial or festive foods
- Local cooking techniques
- Ingredients unique to specific towns

Each entry is tied to a specific Mexican state and town, emphasizing cultural context rather than generic gastronomy.

---

## Why a country-specific contract?

Mexico has a deeply regionalized culinary identity.
Many of its most meaningful dishes are:

- Known primarily by locals
- Linked to specific towns and indigenous communities
- Important for cultural memory, tradition, and identity

A global “food registry” would dilute this context.
This registry is explicitly designed for Mexico’s culinary heritage.

---

## Contract

Deployed on Base:  
`0x6699aa4b7c6fdc355d025106b85abce694bcdf75`  
🔗 https://basescan.org/address/0x6699aa4b7c6fdc355d025106b85abce694bcdf75#code

---

## Data model

Each recorded dish includes:

- `state` – e.g., Oaxaca, Puebla, Yucatán
- `town` – specific locality where the dish originates
- `dishName` – name of the regional dish
- `keyIngredient` – defining or unique ingredient
- `culturalNote` – brief factual context
- `whyItMatters` – explanation of cultural significance
- `likes` / `dislikes` – community voting on relevance and usefulness

---

## Example entries (conceptual)

These are examples of the kind of dishes this registry is meant to capture:

- A ceremonial mole prepared only in Zapotec communities
- A regional bread or dessert tied to a specific town
- A pre-Hispanic cooking method preserved by local families
- A traditional drink consumed only during festivities

Frontends and communities are responsible for ensuring that entries are real and culturally meaningful.

---

## Contract interface

Main functions:

```solidity
recordDish(
  string state,
  string town,
  string dishName,
  string keyIngredient,
  string culturalNote,
  string whyItMatters
);

voteDish(uint256 id, bool like);

totalDishes();

---

Conclusion
This contract provides a country-specific, culturally grounded registry for Mexico.
It is not a generic food list, but a curated log of dishes that matter to the culinary memory and identity of the nation, with community voting to highlight what truly deserves to be remembered.

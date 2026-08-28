-- =============================================================
-- Case ID: TC_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: name ::= simple_name | operator_symbol | character_literal | selected_name | indexed_name | slice_name | attribute_name | external_name
-- Case Type: Positive
-- Test Focus: slice_name and attribute_name forms — exercises name as slice_name (vec(7 downto 4)) and name as attribute_name (sig'length, sig'range) in various expression contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity name_slice_attr_ent is
  port(word_in : in bit_vector(15 downto 0); upper_nibble : out bit_vector(3 downto 0); lower_nibble : out bit_vector(3 downto 0); word_len : out integer);
end entity;

architecture bh of name_slice_attr_ent is
  signal word_reg : bit_vector(15 downto 0) := X"0000";
  signal un_reg : bit_vector(3 downto 0) := X"0";
  signal ln_reg : bit_vector(3 downto 0) := X"0";
begin
  process(word_in)
  begin
    word_reg <= word_in;
    un_reg <= word_reg(15 downto 12);   -- slice_name as name
    ln_reg <= word_reg(3 downto 0);     -- slice_name as name
    word_len <= word_reg'length;         -- attribute_name as name
  end process;
  upper_nibble <= un_reg;
  lower_nibble <= ln_reg;
end architecture bh;

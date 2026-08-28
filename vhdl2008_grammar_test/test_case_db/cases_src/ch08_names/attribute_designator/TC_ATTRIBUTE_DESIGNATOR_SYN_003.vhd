-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: attribute_designator in attribute_name context — 'prefix'attribute_designator syntax where the designator is the simple_name after the tick; exercises attribute_name resolution using the designator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_desig_name_ent is
  port(vec_in : in bit_vector(7 downto 0); vec_len : out integer; vec_range_hi : out integer);
end entity;

architecture bh of attr_desig_name_ent is
  signal vec_reg : bit_vector(7 downto 0) := X"00";
  signal len_reg : integer := 0;
  signal hi_reg : integer := 0;
begin
  process(vec_in)
  begin
    vec_reg <= vec_in;
    len_reg <= vec_reg'length;     -- attribute_designator 'length'
    hi_reg  <= vec_reg'high;       -- attribute_designator 'high'
  end process;
  vec_len <= len_reg;
  vec_range_hi <= hi_reg;
end architecture bh;

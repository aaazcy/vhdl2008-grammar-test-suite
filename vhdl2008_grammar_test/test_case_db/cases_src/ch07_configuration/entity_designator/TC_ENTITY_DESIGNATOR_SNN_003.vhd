-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Negative
-- Test Focus: Integer literal used as entity_tag — entity_designator requires entity_tag to be a name/simple_name (an identifier); an integer literal like '42' is not a valid entity_tag in an attribute specification
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ed_snn3_ent is
  port(
    din  : in  bit_vector(3 downto 0);
    dout : out bit_vector(3 downto 0)
  );
end entity;

architecture bh of ed_snn3_ent is
  attribute keep_hier : boolean;
  -- ERROR: '42' is an integer literal, not a valid entity_tag name
  attribute keep_hier of 42 : signal is true;
  signal buf : bit_vector(3 downto 0) := (others => '0');
begin
  buf  <= din;
  dout <= buf;
end architecture bh;

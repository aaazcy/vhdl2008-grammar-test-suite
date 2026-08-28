-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Test Focus: Entity specification production-specific: exercises all three entity_name_list alternatives (comma-list, others, all) with different entity_class values (entity, architecture, signal, label, function) in attribute specifications
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity espec_prod_specific is
  port(a,b : in bit; y : out bit);
  attribute note : string;
  attribute note of espec_prod_specific : entity is "top";
  attribute note of a, b, y : signal is "ports";
end entity;

architecture bh of espec_prod_specific is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand : gate_nand use entity work.gate_nand(rtl)
    port map(x1=>a, x2=>b, z=>y);
  attribute note of bh : architecture is "beh";
  attribute note of u_nand : label is "inst";
  signal s_local : bit := '0';
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
  s_local <= not y;
end architecture bh;

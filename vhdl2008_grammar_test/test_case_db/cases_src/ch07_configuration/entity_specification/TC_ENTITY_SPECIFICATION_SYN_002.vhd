-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: Entity specification with multi-name entity_name_list — exercises comma-separated entity_designators ("a, b, y : signal") combined with entity_class "signal", using both "all" for component instances and "others" for labels
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity espec_multi_name is
  port(a,b : in bit; y : out bit);
  attribute pin : integer;
  attribute pin of a, b, y : signal is 1;
end entity;

architecture bh of espec_multi_name is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor1, u_nor2 : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y);
  attribute pin of u_nor1 : label is 2;
  signal s_a, s_b : bit := '0';
begin
  u_nor1 : gate_nor port map(x1=>a, x2=>b, z=>y);
  u_nor2 : gate_nor port map(x1=>s_a, x2=>s_b, z=>open);
  s_a <= a; s_b <= b;
end architecture bh;

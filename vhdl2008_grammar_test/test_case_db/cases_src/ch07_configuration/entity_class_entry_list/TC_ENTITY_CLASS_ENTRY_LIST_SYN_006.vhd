-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: six-entry entity_class_entry_list mixing box and non-box — "entity, architecture, signal <>, signal <>, label, component <>" with six entries in total, verifies correct parsing of a longer comma-separated list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity ecl_six_entries is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of ecl_six_entries is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y);
  signal s1, s2 : bit := '0';
  group full_design is (entity, architecture, signal, signal, label, component <>);
  group fd : full_design (ecl_six_entries, rtl, s1, s2, u_nor, gate_nor);
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y);
  s1 <= y;
  s2 <= not s1;
end architecture rtl;

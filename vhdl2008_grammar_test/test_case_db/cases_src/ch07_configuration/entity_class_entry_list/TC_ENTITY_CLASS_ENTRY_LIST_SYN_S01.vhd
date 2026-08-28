-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Test Focus: Entity class entry list production-specific: five-entry list "signal <>, constant, variable <>, label, component <>" exercising both box/non-box forms with maximum comma-separated repetition
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ecl_prod_specific is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ecl_prod_specific is
  group full_path is (signal, constant, label, component, entity <>);
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  signal s_local : bit := '0';
  constant C_DLY : time := 1 ns;
  group fp : full_path (s_local, C_DLY, u_and, gate_and, ecl_prod_specific);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
  s_local <= y after C_DLY;
end architecture bh;

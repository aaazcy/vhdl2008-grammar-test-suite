-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SEM_001
-- Related Rule ID: SEM_ENTITY_C_001
-- Rule Type: Semantic
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive (Semantic)
-- Test Focus: semantics of entity_class_entry_list: the multi-entry list of a group template defines the type constraints of group members — the "signal, label" list requires the group declaration to provide exactly one named object for signal and one for label, verifies the semantic match between the list entry count and the number of named objects in the group declaration
-- Expected Result: Compiles successfully; group template entry count matches group declaration object count semantically
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity ecl_sem_count_match is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of ecl_sem_count_match is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_or : gate_or use entity work.gate_or(rtl)
    port map(x1=>a, x2=>b, z=>y);
  signal s_chain : bit := '0';
  group path3 is (signal, label, signal);
  group p3 : path3 (s_chain, u_or, y);
  attribute location : string;
  attribute location of p3 : group is "chip_right";
begin
  u_or : gate_or port map(x1=>a, x2=>b, z=>y);
  s_chain <= y;
end architecture rtl;

-- =============================================================
-- Case ID: TC_SEM_ARCH_002_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_002
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: The entity_name of architecture_body must reference a declared entity - referencing an entity that exists in the library but is not declared in this design file also triggers an error
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: Negative case 2: architecture references entity_name "entity_in_other_file" (that entity is not declared in the current design file and is not imported by a use clause), verifying the analyzer finds no matching declaration for entity_name in the visible scope when compiling this architecture
-- Expected Result: Triggers semantic error: entity_name not found in visible scope
-- Dependencies: None
-- =============================================================
entity sem_arch_002_local is
  port(clk:in bit; q:out bit);
end entity;
architecture bh of entity_in_other_file is
  signal s:bit:='0';
begin
  s<=clk;
  q<=s;
end architecture bh;

-- =============================================================
-- Case ID: TC_ALLOCATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Test Focus: SNN: missing "new" keyword — a subtype_indication written directly without new, verifying that an allocator must start with new
-- Expected Result: Triggers syntax error: missing 'new' keyword before subtype_indication
-- Dependencies: None
-- =============================================================

entity ent_alloc_snn_001 is
  port (d : in integer);
end entity ent_alloc_snn_001;

architecture miss_new of ent_alloc_snn_001 is
  type int_ptr is access integer;
  signal s_p : int_ptr;
begin
  -- ERROR: Missing 'new' keyword — allocator syntax requires 'new'
  s_p <= integer;
end architecture miss_new;

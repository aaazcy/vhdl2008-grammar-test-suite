-- =============================================================
-- Case ID: TC_ALLOCATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Test Focus: SNN: dangling new with no assignment target — new integer appears as a standalone statement but is not assigned to any access object
-- Expected Result: Triggers syntax error: allocator expression used as statement without assignment target
-- Dependencies: None
-- =============================================================

entity ent_alloc_snn_004 is
  port (go : in bit);
end entity ent_alloc_snn_004;

architecture dangling of ent_alloc_snn_004 is
  type int_ptr is access integer;
begin
  process(go)
  begin
    if go'event and go = '1' then
      -- ERROR: Dangling allocator — no assignment target
      new integer;
    end if;
  end process;
end architecture dangling;

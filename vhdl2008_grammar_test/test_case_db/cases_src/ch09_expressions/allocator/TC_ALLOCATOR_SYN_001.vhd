-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: Minimal form: new integer used in a variable assignment, verifying the most basic subtype_indication form of an allocator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_int is
  port (
    a : in integer
  );
end entity ent_alloc_int;

architecture alloc_simple of ent_alloc_int is
begin
  process(a)
    type int_ptr is access integer;
    variable v : int_ptr;
  begin
    v := new integer;
  end process;
end architecture alloc_simple;

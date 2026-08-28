-- =============================================================
-- Case ID: TC_ALLOCATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ALLOCATOR_TYPE_MATCH
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Rule Description: The type of the allocator must match the designated type of the access type to which it is assigned.
-- Error Category: Type mismatch
-- Test Focus: SMN: allocator type does not match the target access type — the result of new bit_vector is assigned to a signal of access integer
-- Expected Result: Triggers type error: allocator designated type does not match access type target
-- Dependencies: None
-- =============================================================

entity ent_alloc_smn_001 is
  port (go : in bit);
end entity ent_alloc_smn_001;

architecture type_mismatch of ent_alloc_smn_001 is
  type int_ptr is access integer;
  signal s_p : int_ptr;
begin
  process(go)
  begin
    if go'event and go = '1' then
      -- ERROR: Allocator type mismatch — bit_vector allocated into access integer
      s_p <= new bit_vector(0 to 7);
    end if;
  end process;
end architecture type_mismatch;

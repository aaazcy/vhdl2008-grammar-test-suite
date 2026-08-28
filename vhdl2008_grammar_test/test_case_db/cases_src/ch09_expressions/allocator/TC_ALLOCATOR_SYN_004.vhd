-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: new qualified_expression form: new bit_vector'(x"AB") uses a qualified expression to initialize the allocated storage
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_qual is
  port (
    trigger : in bit
  );
end entity ent_alloc_qual;

architecture alloc_qualified of ent_alloc_qual is
  type bv_ptr is access bit_vector(7 downto 0);
begin
  process(trigger)
    variable s_ptr : bv_ptr;
  begin
    if trigger'event and trigger = '1' then
      s_ptr := new bit_vector'(x"AB");
    end if;
  end process;
end architecture alloc_qualified;

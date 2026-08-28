-- =============================================================
-- Case ID: TC_ALLOCATOR_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ALLOCATOR_NULL
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Rule Description: The literal null is the default initial value for an access type. Dereferencing a null access value is an error.
-- Error Category: Null dereference
-- Test Focus: SMN: dereferencing a null access value — calling .all on an uninitialized access signal (default null) causes a runtime error
-- Expected Result: Triggers runtime error: dereference of null access value
-- Dependencies: None
-- =============================================================

entity ent_alloc_smn_002 is
  port (clk : in bit);
end entity ent_alloc_smn_002;

architecture null_deref of ent_alloc_smn_002 is
  type int_ptr is access integer;
  signal s_p : int_ptr;
begin
  process(clk)
    variable v : integer;
  begin
    if clk'event and clk = '1' then
      -- ERROR: Dereferencing null access value (s_p not yet allocated)
      v := s_p.all;
    end if;
  end process;
end architecture null_deref;

-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: new with a constrained array subtype indication: new bit_vector(7 downto 0) allocates a vector of the specified length for the access type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_bvec is
  port (
    clk : in bit
  );
end entity ent_alloc_bvec;

architecture alloc_array of ent_alloc_bvec is
  type bv_ptr is access bit_vector(7 downto 0);
begin
  process(clk)
    variable s_buf : bv_ptr;
  begin
    if clk'event and clk = '1' then
      s_buf := new bit_vector(7 downto 0);
    end if;
  end process;
end architecture alloc_array;

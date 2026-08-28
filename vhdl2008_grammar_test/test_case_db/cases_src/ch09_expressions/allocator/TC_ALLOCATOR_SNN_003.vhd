-- =============================================================
-- Case ID: TC_ALLOCATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Negative
-- Test Focus: SNN: unconstrained array missing its constraint — new bit_vector provides no index range; the subtype indication of an unconstrained array must include a constraint
-- Expected Result: Triggers syntax error: unconstrained array subtype_indication requires constraint in allocator
-- Dependencies: None
-- =============================================================

entity ent_alloc_snn_003 is
  port (clk : in bit);
end entity ent_alloc_snn_003;

architecture miss_constr of ent_alloc_snn_003 is
  type bv_ptr is access bit_vector;
  signal s_p : bv_ptr;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      -- ERROR: Missing constraint for unconstrained array in allocator
      s_p <= new bit_vector;
    end if;
  end process;
end architecture miss_constr;

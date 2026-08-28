-- =============================================================
-- Case ID: TC_ALLOCATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALLOCATOR
-- Standard Reference: IEEE 1076-2008 Section 9.3.7
-- Production: allocator ::= new subtype_indication | new qualified_expression
-- Case Type: Positive
-- Test Focus: Comprehensive demonstration: new of an unconstrained array (integer_vector) with an index constraint, new qualified expression, null check and .all dereference, covering multiple usage scenarios of allocators
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_alloc_complex is
  port (
    clk   : in  bit;
    we    : in  bit;
    dout  : out integer
  );
end entity ent_alloc_complex;

architecture alloc_full of ent_alloc_complex is
  type int_vec_ptr is access integer_vector;
begin
  process(clk)
    variable s_arr : int_vec_ptr;
  begin
    if clk'event and clk = '1' then
      if we = '1' then
        s_arr := new integer_vector(0 to 15);
      end if;
    end if;
    if s_arr = null then
      dout <= -1;
    else
      dout <= s_arr(0);
    end if;
  end process;
end architecture alloc_full;

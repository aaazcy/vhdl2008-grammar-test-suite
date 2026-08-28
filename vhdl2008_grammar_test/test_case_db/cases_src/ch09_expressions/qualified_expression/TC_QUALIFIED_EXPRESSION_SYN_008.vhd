-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: comprehensive demonstration: using a qualified expression in an allocator — new bit_vector'(x"F0") combines a qualified expression with an allocator, verifying the composite context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_alloc is
  port (
    clk  : in  bit;
    dout : out bit_vector(7 downto 0)
  );
end entity ent_qe_alloc;

architecture with_alloc of ent_qe_alloc is
  type bv_ptr is access bit_vector(7 downto 0);
begin
  process(clk)
    variable s_p : bv_ptr;
  begin
    if clk'event and clk = '1' then
      s_p := new bit_vector'(x"F0");
    end if;
    if s_p = null then
      dout <= (others => '0');
    else
      dout <= s_p.all;
    end if;
  end process;
end architecture with_alloc;

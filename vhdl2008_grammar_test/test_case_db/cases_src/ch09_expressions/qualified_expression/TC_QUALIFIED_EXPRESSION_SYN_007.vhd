-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: resolving overload ambiguity: the signal assignment integer'(0) resolves the ambiguity between an enumeration literal and integer 0, verifying the use of a qualified expression to resolve overloading
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_ambig is
  port (
    sel  : in  bit;
    dout : out integer
  );
end entity ent_qe_ambig;

architecture disambig of ent_qe_ambig is
  type t_mode is (READ, WRITE, IDLE);
  signal s_data : integer;
begin
  process(sel)
  begin
    if sel = '1' then
      s_data <= integer'(0);
    else
      s_data <= integer'(1);
    end if;
  end process;
  dout <= s_data;
end architecture disambig;

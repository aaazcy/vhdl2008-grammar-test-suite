-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: procedure+function dual declarations in the same declarative region: function declaration follows procedure declaration in the same declaration region, verification of multiple subprogram_declarations coexisting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_both is
  procedure p_clr(signal v:out integer);
  function f_dbl(x:integer) return integer;
end package pkg_sd_both;
package body pkg_sd_both is
  procedure p_clr(signal v:out integer) is begin v<=0; end procedure;
  function f_dbl(x:integer) return integer is begin return x*2; end function;
end package body pkg_sd_both;
entity sd_both_ent is port(clr:in bit; y:out integer); end entity;
architecture bh of sd_both_ent is
  signal s_val:integer:=42;
begin
  process(clr) begin
    if clr='1' then work.pkg_sd_both.p_clr(s_val); end if;
  end process;
  y<=work.pkg_sd_both.f_dbl(s_val);
end architecture bh;

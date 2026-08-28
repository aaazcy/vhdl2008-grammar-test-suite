-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: dual procedure+function instantiation in the same scope: procedure p1 is new gen.p_a + function f1 is new gen.f_b used simultaneously, verifies multiple subprogram instantiations coexist
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_dual_pkg is
  procedure p_inc generic(type t) parameter(signal v:inout t);
  function f_dbl generic(type t) parameter(x:t) return t;
end package;
package body gen_dual_pkg is
  procedure p_inc generic(type t) parameter(signal v:inout t) is begin v<=v; end procedure;
  function f_dbl generic(type t) parameter(x:t) return t is begin return x; end function;
end package body;
entity sid_dual_ent is port(clk:in bit; r:out integer); end entity;
architecture bh of sid_dual_ent is
  procedure p_cnt is new work.gen_dual_pkg.p_inc generic map(t=>integer);
  function f_mul2 is new work.gen_dual_pkg.f_dbl generic map(t=>integer);
  signal s_val:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then p_cnt(s_val); end if;
  end process;
  r<=f_mul2(s_val);
end architecture bh;

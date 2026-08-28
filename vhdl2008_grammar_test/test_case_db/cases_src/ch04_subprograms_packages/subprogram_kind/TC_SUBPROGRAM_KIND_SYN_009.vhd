-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: subprogram_kind (procedure) in a subprogram_instantiation declaration: procedure p is new gen.p, verifies procedure as subprogram_kind in the instantiation syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_proc_sk is
  procedure p_inc generic(type t) parameter(signal v:inout t);
end package;
package body gen_proc_sk is
  procedure p_inc generic(type t) parameter(signal v:inout t) is begin v<=v; end procedure;
end package body;
entity sk_pinst_ent is port(clk:in bit; cnt:out integer); end entity;
architecture bh of sk_pinst_ent is
  procedure p_count is new work.gen_proc_sk.p_inc generic map(t=>integer);
  signal s:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then p_count(s); end if;
  end process;
  cnt<=s;
end architecture bh;

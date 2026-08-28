-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: procedure_specification with multiple parameters and interface classes: procedure p(signal a:in bit; variable b:inout integer), verifies the parameter diversity of the procedure branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ss_proc_ent is port(a:in bit; y:out integer); end entity;
architecture bh of ss_proc_ent is
  procedure p_inc(signal en:in bit; variable cnt:inout integer) is
  begin
    if en='1' then cnt:=cnt+1; end if;
  end procedure;
  signal s_count:integer:=0;
begin
  process(a)
    variable v:integer:=0;
  begin
    p_inc(a,v);
    s_count<=v;
  end process;
  y<=s_count;
end architecture bh;

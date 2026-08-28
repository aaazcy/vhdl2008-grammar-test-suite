-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Subprogram declarations and bodies in the declarative part: pure function + impure function + procedure declaration + procedure body, actually calling them in concurrent statements, verifying subprograms can be declared and defined in architecture_declarative_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_subp_ent is
  port(a,b:in integer; op:in bit; y:out integer);
end entity;
architecture rtl of arch_subp_ent is
  function f_mul(x,y:integer) return integer is
  begin return x*y; end function;
  impure function f_sel(x,y:integer; sel:bit) return integer is
    variable v:integer;
  begin
    if sel='1' then v:=f_mul(x,y); else v:=x+y; end if;
    return v;
  end function;
  procedure p_log(signal v:in integer) is
  begin
    report "[p_log] value = " & integer'image(v) severity note;
  end procedure;
  signal s_result:integer:=0;
begin
  s_result<=f_sel(a,b,op);
  p_log(s_result);
  y<=s_result;
end architecture rtl;

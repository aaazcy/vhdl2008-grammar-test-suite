-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008: protected type, shared variable, subprogram in architecture, all declarations
-- Expected Result: Compiles successfully (VHDL 2008)
-- Dependencies: None
-- =============================================================
entity arch_2008_ent is port(a:in integer; y:out integer); end entity;
architecture vhdl2008 of arch_2008_ent is
  type t_prot is protected procedure inc; impure function val return integer; end protected;
  type t_prot is protected body
    variable v:integer:=0;
    procedure inc is begin v:=v+1; end;
    impure function val return integer is begin return v; end;
  end protected body;
  shared variable sv_ctr:t_prot;
  function f_dbl(x:integer) return integer is begin return x*2; end function;
begin
  sv_ctr.inc; y<=f_dbl(a)+sv_ctr.val;
end architecture vhdl2008;

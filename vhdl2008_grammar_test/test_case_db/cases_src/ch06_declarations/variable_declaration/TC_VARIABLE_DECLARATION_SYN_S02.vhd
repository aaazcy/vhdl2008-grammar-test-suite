-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: shared variable of protected type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity var_spc2_ent is port(r:out integer); end entity;
architecture bh of var_spc2_ent is
  type t_counter is protected
    procedure inc;
    impure function val return integer;
  end protected;
  type t_counter is protected body
    variable v : integer := 0;
    procedure inc is begin v := v + 1; end;
    impure function val return integer is begin return v; end;
  end protected body;
  shared variable sv_ctr : t_counter;
begin
  process
  begin
    sv_ctr.inc;
    sv_ctr.inc;
    r <= sv_ctr.val; wait;
  end process;
end architecture bh;

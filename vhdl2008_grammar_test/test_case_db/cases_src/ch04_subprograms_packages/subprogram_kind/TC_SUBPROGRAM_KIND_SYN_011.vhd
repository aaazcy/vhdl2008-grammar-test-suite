-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: subprogram_kind (procedure) in a protected type body: a procedure definition inside the protected body, verifies subprogram_kind in the protected type context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_pt_ent is port(r:out integer); end entity;
architecture bh of sk_pt_ent is
  type t_ctr is protected
    procedure inc;
    impure function val return integer;
  end protected;
  type t_ctr is protected body
    variable cnt:integer:=0;
    procedure inc is begin cnt:=cnt+1; end procedure;
    impure function val return integer is begin return cnt; end function;
  end protected body;
begin
  r<=0;
end architecture bh;

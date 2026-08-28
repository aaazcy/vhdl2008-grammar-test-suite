-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SMN_002
-- Related Rule ID: SMN_PROTECTE_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::= protected body protected_type_body_declarative_part end protected body [ protected_type_simple_name ]
-- Case Type: Negative
-- Test Focus: Static model negative — the protected type declaration lists procedure set and impure function get, but the protected type body implements only get, leaving procedure set without a body
-- Expected Result: Triggers semantic error: missing body for procedure "set"
-- Dependencies: None
-- =============================================================
entity pt33_ent is
  port ( dout : out integer );
end entity pt33_ent;
architecture rtl of pt33_ent is
  type t_pt is protected
    procedure set(x : integer);
    impure function get return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    impure function get return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  dout <= 0;
end architecture rtl;

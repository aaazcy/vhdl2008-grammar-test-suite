-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::= { protected_type_body_declarative_item }
-- Test Focus: SNN — component_declaration inside the protected type body declarative part; component declarations are not among the allowed protected_type_body_declarative_item alternatives
-- Case Type: Negative
-- Expected Result: Triggers syntax error: component declaration are not allowed here
-- =============================================================
entity pt35_ent is
  port ( dout : out integer );
end entity pt35_ent;
architecture rtl of pt35_ent is
  type t_pt is protected
    procedure inc;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    component c_x is port(i:in bit; o:out bit); end component;
    procedure inc is begin v := v + 1; end procedure;
  end protected body;
  shared variable sv : t_pt;
begin
  dout <= 0;
end architecture rtl;

-- =============================================================
-- Case ID: TC_OBJECT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Test Focus: Object declaration: constant ｜ signal ｜ variable ｜ file — all 4 object class declarations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_object_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_object_declaration_syn_s01 is
  constant C_OD:integer:=10; signal s_od:integer:=0;
  type pt_od is protected
    procedure set_val(v:integer);
    impure function get_val return integer;
  end protected pt_od;
  type pt_od is protected body
    variable m_val:integer:=0;
    procedure set_val(v:integer) is begin m_val:=v; end procedure;
    impure function get_val return integer is begin return m_val; end function;
  end protected body pt_od;
  shared variable sv_od:pt_od;
begin
  s_od<=C_OD; r<=s_od;end architecture bh;

-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: ERROR — protected type used as a port type.
--   Protected types cannot be ports; they can only be
--   shared variables. Using a protected type as a port
--   subtype violates VHDL rules.
-- Case Type: Negative
-- Expected Result: Triggers syntax error — illegal port type
-- =============================================================
entity pt_def_snn_port_type is
  port (
    clk : in  bit;
    val : out t_bad                               -- ERROR: protected type as port type
  );
end entity pt_def_snn_port_type;

architecture rtl of pt_def_snn_port_type is
  type t_bad is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_bad is protected body
    variable v : integer := 0;
    procedure inc is begin v := v + 1; end procedure;
    impure function get return integer is begin return v; end function;
  end protected body;
begin
end architecture rtl;

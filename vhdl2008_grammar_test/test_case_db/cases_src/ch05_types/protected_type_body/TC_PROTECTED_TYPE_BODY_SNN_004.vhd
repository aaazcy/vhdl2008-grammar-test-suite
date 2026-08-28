-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SNN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: ERROR — signal declaration inside protected body.
--   The body declarative part allows subprogram_body, type,
--   subtype, constant, variable, file, alias, attribute, and
--   use_clause declarations but NOT signal declarations.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_snn_signal_in_body is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_snn_signal_in_body;

architecture rtl of pt_body_snn_signal_in_body is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    signal s_err : bit;                        -- ERROR: signal not allowed in body
    procedure inc is begin v := v + 1; end procedure;
    impure function get return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.inc; val <= sv.get;
    end if;
  end process;
end architecture rtl;

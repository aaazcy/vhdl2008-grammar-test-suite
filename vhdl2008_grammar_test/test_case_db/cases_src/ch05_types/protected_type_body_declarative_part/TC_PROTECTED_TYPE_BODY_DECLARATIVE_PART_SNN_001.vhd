-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: ERROR — signal declaration placed inside the body
--   declarative part. Signals are not in the set of valid
--   body declarative items. This tests the boundary of what
--   the repetition grammar allows.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_dp_snn_signal is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_dp_snn_signal;

architecture rtl of pt_body_dp_snn_signal is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
    signal s_bad : bit;                        -- ERROR: signal not in { body_declarative_item }
    variable v : integer := 0;
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

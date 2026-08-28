-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: ERROR — process statement inside the body
--   declarative part. Processes are concurrent statements,
--   not declarative items. They have no place inside a
--   protected body declarative part.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_dp_snn_process is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_dp_snn_process;

architecture rtl of pt_body_dp_snn_process is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    process                                    -- ERROR: process not a declarative item
    begin
    end process;
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

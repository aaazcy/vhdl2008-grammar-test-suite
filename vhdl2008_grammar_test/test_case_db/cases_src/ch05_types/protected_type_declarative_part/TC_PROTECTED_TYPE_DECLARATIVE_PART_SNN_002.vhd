-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: ERROR — signal declaration in the declarative
--   part of the type declaration. Signals are not valid as
--   protected type declarative items.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_dp_snn_signal is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_snn_signal;

architecture rtl of pt_decl_dp_snn_signal is
  type t_pt is protected
    signal s_err : bit;                        -- ERROR: signal not in { declarative_item }
    procedure set(x : integer);
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(1); val <= 1;
    end if;
  end process;
end architecture rtl;

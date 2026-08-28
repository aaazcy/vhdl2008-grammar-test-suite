-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: ERROR — variable declaration in the declarative
--   part of the type declaration. Variables are not valid
--   declarative items in this context (they're body-only).
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_dp_snn_variable is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_snn_variable;

architecture rtl of pt_decl_dp_snn_variable is
  type t_pt is protected
    variable v_err : integer := 0;             -- ERROR: variable not in { declarative_item }
    procedure inc;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure inc is begin v := v + 1; end procedure;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.inc; val <= 1;
    end if;
  end process;
end architecture rtl;

-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: ERROR — shared variable declaration inside the
--   body declarative part. Shared variables are not valid
--   body declarative items per the BNF.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_dp_snn_sharedvar is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_dp_snn_sharedvar;

architecture rtl of pt_body_dp_snn_sharedvar is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
    shared variable v_bad : integer := 0;      -- ERROR: shared variable not in { body_declarative_item }
    procedure inc is begin v_bad := v_bad + 1; end procedure;
    impure function get return integer is begin return v_bad; end function;
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

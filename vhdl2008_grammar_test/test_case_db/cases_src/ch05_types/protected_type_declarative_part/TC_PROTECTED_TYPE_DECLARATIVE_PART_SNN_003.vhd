-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: ERROR — subprogram_body (full implementation)
--   inside the declaration's declarative part. Only
--   subprogram_declaration (specification without body)
--   belongs here; implementations go in the protected body.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_dp_snn_body is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_snn_body;

architecture rtl of pt_decl_dp_snn_body is
  type t_pt is protected
    procedure inc is                           -- ERROR: body not allowed in declaration
    begin
    end procedure;
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

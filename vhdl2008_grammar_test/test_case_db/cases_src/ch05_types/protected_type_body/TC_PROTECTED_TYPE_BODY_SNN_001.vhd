-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SNN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: ERROR — missing keyword 'body' after 'protected'.
--   The BNF requires the pair 'protected body' to open a body.
--   Using just 'protected' without 'body' is a syntax error
--   specific to this production.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_snn_missing_body_kw is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_snn_missing_body_kw;

architecture rtl of pt_body_snn_missing_body_kw is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected                     -- ERROR: missing 'body'
    variable v : integer := 0;
    procedure inc is begin v := v + 1; end procedure;
    impure function get return integer is begin return v; end function;
  end protected;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.inc; val <= sv.get;
    end if;
  end process;
end architecture rtl;

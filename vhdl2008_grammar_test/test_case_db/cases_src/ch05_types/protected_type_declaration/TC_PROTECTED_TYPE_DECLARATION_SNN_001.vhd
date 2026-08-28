-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: ERROR — missing 'end protected' closing phrase.
--   Using just 'end' without 'protected' violates the BNF
--   which requires the full 'end protected' keyword pair.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_snn_missing_protected is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_snn_missing_protected;

architecture rtl of pt_decl_snn_missing_protected is
  type t_pt is protected
    procedure set(x : integer);
  end;                                        -- ERROR: should be 'end protected'
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

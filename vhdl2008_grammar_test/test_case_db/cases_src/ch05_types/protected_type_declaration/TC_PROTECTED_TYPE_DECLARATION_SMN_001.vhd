-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SMN_001
-- Related Rule ID: SMN_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: SEMANTIC NEGATIVE — protected type declaration
--   declares a method but its corresponding body provides a
--   different number of parameters. The declaration has
--   `procedure set` with one param; body has set with two.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — signature mismatch
-- =============================================================
entity pt_decl_smn_param_count is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_smn_param_count;

architecture rtl of pt_decl_smn_param_count is
  type t_pt is protected
    procedure set(x : integer);
    impure function get return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    -- ERROR: declaration has 1 param, body has 2 params
    procedure set(x : integer; y : integer) is
    begin v := x + y; end procedure;
    impure function get return integer is
    begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(42, 10);
      val <= sv.get;
    end if;
  end process;
end architecture rtl;

-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SMN_001
-- Related Rule ID: SMN_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: SEMANTIC NEGATIVE — use_clause references a
--   nonexistent library. Syntactically valid as a declarative
--   item, but the library doesn't exist at elaboration.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — unknown library
-- =============================================================
entity pt_decl_dp_smn_bad_lib is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_smn_bad_lib;

architecture rtl of pt_decl_dp_smn_bad_lib is
  type t_pt is protected
    use nosuchlib.all;                         -- ERROR: library does not exist
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
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
